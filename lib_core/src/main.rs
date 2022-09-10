#![cfg_attr(not(test), no_std)]
#![cfg_attr(not(test), no_main)]

extern "C" {
    fn respond(addr: i32, data: i32);
}

#[no_mangle]
pub extern "C" fn compute(addr: i32, data: i32) {
    unsafe { respond(addr, data * 2) };
}

#[no_mangle]
pub extern "C" fn multiply_by_two(data: i32) -> i32 {
    data * 2
}

#[cfg(test)]
mod tests {
    use crate::multiply_by_two;

    #[test]
    fn multiplies_by_two() {
        assert_eq!(multiply_by_two(5), 10);
    }
}

// Panic Handling
#[cfg(not(test))]
use core::panic::PanicInfo;
#[cfg(not(test))]
#[cfg_attr(not(test), panic_handler)]
fn panic_handler(_info: &PanicInfo) -> ! {
    loop {}
}