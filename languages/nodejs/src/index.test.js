const MyLib = require('./index')

test('multiplies by two', async () => {
    const lib = await MyLib.load();
    expect(lib.multiply_by_two(25)).toBe(50);
    expect(lib.multiply_by_two(50)).toBe(100);
    expect(lib.multiply_by_two(125)).toBe(250);
});

test('reports logs', async () => {
    const lib = await MyLib.load();

    MyLib.log = jest.fn().mockReturnValue(null);
    lib.test_log("aaa");
    lib.test_log("bbb");
    lib.test_log("This is a log");

    expect(MyLib.log).toHaveBeenCalledWith("aaa");
    expect(MyLib.log).toHaveBeenCalledWith("bbb");
    expect(MyLib.log).toHaveBeenCalledWith("This is a log");
});