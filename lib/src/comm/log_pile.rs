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
        self.next = (self.next + 1) % PILE_SIZE;
        &mut self.logs[self.next]
    }

    pub fn map(&mut self, apply: &dyn Fn(&mut LogMessage<MSG_SIZE>)) {
        for _i in 0..PILE_SIZE { apply(self.next()); }
    }
}