#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic_handler(_info: &PanicInfo) -> ! {
    loop {}
}

extern "C" {
    fn respond(addr: i32, data: i32);
}

#[no_mangle]
pub extern "C" fn compute(addr: i32, data: i32) {
    unsafe { respond(addr, data * 2) };
}
