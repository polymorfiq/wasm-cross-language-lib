#![no_std]
#![no_main]
use lib::comm::LogMessage;
use lib::comm::LogPile;

extern "C" {
    fn report_log(addr: usize, length: usize);
}

pub const MAX_PILE_SIZE: usize = 5;
pub const MAX_LOG_SIZE: usize = 30;

pub static mut LOG: LogPile<MAX_PILE_SIZE, MAX_LOG_SIZE> = LogPile{
    next: 0,
    logs: [LogMessage{
        length: 0,
        message: [0u8; MAX_LOG_SIZE]
    }; MAX_PILE_SIZE]
};

#[no_mangle]
pub extern "C" fn alloc_utf8_log(bytes: usize) -> usize {
    if bytes <= MAX_LOG_SIZE {
        let mut next_log = unsafe { LOG.next() };
        next_log.length = bytes;

        next_log.message.as_ptr() as *const () as usize
    } else {
        0
    }
}

#[no_mangle]
pub extern "C" fn flush_utf8_logs() {
    unsafe { LOG.map(&do_log) }
}

#[no_mangle]
pub extern "C" fn multiply_by_two(data: usize) -> usize {
    data * 2
}

pub fn do_log(message: &mut LogMessage<MAX_LOG_SIZE>) {
    if message.length == 0 { return }

    unsafe {
        report_log(message.message.as_ptr() as *const () as usize, message.length);
    }

    message.length = 0;
}