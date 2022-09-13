const { MyLib } = require('./index')

test('multiplies by two', async () => {
    const lib = await MyLib.new();
    expect(lib.multiply_by_two(25)).toBe(50);
    expect(lib.multiply_by_two(50)).toBe(100);
    expect(lib.multiply_by_two(125)).toBe(250);
});