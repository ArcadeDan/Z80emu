const std = @import("std");

const byte = u8;
const word = u16;

const Cpu = struct {
    a: byte,
    x: byte,
    y: byte,
    pc: word,
    sp: byte,
    p: byte,
};




const Memory = struct {
    data: [65536]byte,
};


pub fn spawn_memory() !Memory {

    var d = std.mem.zeroes([65536]byte);
    var mem = Memory{ .data = d };
    return mem;
}

pub fn main() !void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    var memory = spawn_memory();
    memory.data[0] = try 0x69; 

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try bw.flush(); // don't forget to flush!
}
