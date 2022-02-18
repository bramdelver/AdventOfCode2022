const std = @import("std");
const input = @embedFile("./02.txt");
const Position = struct { aim: i64, depth: i64, horizontal: i64 };
const assert = std.debug.assert;

pub fn main() !void {
    var lines = std.mem.tokenize(u8, input, "\n");
    var posPartOne = Position{ .depth = 0, .aim = 0, .horizontal = 0 };
    var posPartTwo = Position{ .depth = 0, .aim = 0, .horizontal = 0 };

    while (lines.next()) |line| {
        if (line.len == 0) continue;

        var part = std.mem.split(u8, line, " ");
        const direction = part.next().?;
        const amount = std.fmt.parseInt(i64, part.next().?, 10) catch unreachable;

        assert(part.next() == null);

        if (std.mem.eql(u8, direction, "forward")) {
            posPartOne.horizontal += amount;
            posPartTwo.horizontal += amount;
            posPartTwo.depth += posPartTwo.aim * amount;
            continue;
        }

        if (std.mem.eql(u8, direction, "down")) {
            posPartOne.depth += amount;
            posPartTwo.aim += amount;
            continue;
        }

        if (std.mem.eql(u8, direction, "up")) {
            posPartOne.depth -= amount;
            posPartTwo.aim -= amount;
            continue;
        }
    }

    const resultPartOne: i64 = posPartOne.horizontal * posPartOne.depth;
    const resultPartTwo: i64 = posPartTwo.horizontal * posPartTwo.depth;
    std.debug.print("part 1: {d}\n", .{resultPartOne});
    std.debug.print("part 2: {d}\n", .{resultPartTwo});
}
