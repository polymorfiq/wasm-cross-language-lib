use core::str;

#[derive(Clone, Copy)]
pub struct LogMessage<const MAX_MSG_SIZE: usize> {
    pub length: usize,
    pub message: [u8; MAX_MSG_SIZE]
}

pub struct LogPile<const PILE_SIZE: usize, const MSG_SIZE: usize> {
    pub next: usize,
    pub logs: [LogMessage<MSG_SIZE>; PILE_SIZE]
}

impl<const PILE_SIZE: usize, const MSG_SIZE: usize> LogPile<PILE_SIZE, MSG_SIZE> {
    pub fn next(&mut self) -> &mut LogMessage<MSG_SIZE> {
        let curr_idx = self.next;
        self.next = (self.next + 1) % PILE_SIZE;
        &mut self.logs[curr_idx]
    }

    pub fn flush(&mut self, print: &dyn Fn(LogMessage<MSG_SIZE>)) -> u32 {
        let mut i = 0;
        let mut seen: u32 = 0;
        while i < PILE_SIZE {
            let mut curr = self.next();

            if curr.length > 0 {
                print(*curr);
                curr.length = 0;
                seen += 1;
            }

            i += 1;
        }

        seen
    }

    pub fn write(&mut self, message: &str) -> *const LogMessage<MSG_SIZE> {
        let mut curr = self.next();

        let bytes = message.as_bytes();
        curr.length = bytes.len();

        let mut i = 0;
        while i < MSG_SIZE && i < bytes.len() {
            curr.message[i] = bytes[i];
            i += 1;
        }
        
        curr as *const LogMessage<MSG_SIZE>
    }
}