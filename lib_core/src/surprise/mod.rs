// Panic Handling
#[cfg(not(test))]
use core::panic::PanicInfo;

#[cfg(not(test))]
#[cfg_attr(not(test), panic_handler)]
fn panic_handler(_info: &PanicInfo) -> ! {
    loop {}
}