const std = @import("std");
const io = std.io;
const fmt = std.fmt;

const input = @embedFile("./01.txt");

pub fn main() !void {
    var lines = std.mem.tokenize(u8, input, "\n");
    var nums: [2000]u32 = undefined;
    var j: u32 = 0;
    while (lines.next()) |line| {
        nums[j] = try fmt.parseInt(u32, line, 10);
        j += 1;
    }

    {
        var countPartOne: u32 = 0;
        var i: u32 = 0;
        while (i < nums.len - 1) : (i += 1) {
            if (nums[i + 1] > nums[i]) countPartOne += 1;
        }
        std.debug.print("Part one: {d}\n", .{countPartOne});
    }

    {
        var countPartTwo: u32 = 0;
        var i: u32 = 0;
        while (i < nums.len - 3) : (i += 1) {
            if (nums[i + 3] > nums[i]) countPartTwo += 1;
        }
        std.debug.print("Part two: {d}\n", .{countPartTwo});
    }
}
