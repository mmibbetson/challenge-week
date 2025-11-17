const std = @import("std");
const rugby = @import("rugby");

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    var args = try std.process.argsWithAllocator(arena.allocator());
    _ = args.next();

    const score_arg = args.next() orelse {
        std.debug.print("Please pass a single argument representing the score.\n\n", .{});
        return error.MissingArgument;
    };

    const score = try std.fmt.parseInt(u64, score_arg, 10);
    const routes = try rugby.lib.findRoutes(arena.allocator(), score);
    std.debug.print("There are {} routes to the score {}.\n", .{ routes, score });
}
