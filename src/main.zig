const std = @import("std");
const rugby = @import("rugby");

const POINTS_PENALTY = 3;
const POINTS_TRY = 5;
const POINTS_CONVERSION = 7;
const SCORES = [_]u64{ 0, 1, 2, 3, 4, 5, 7, 9, 10, 12, 15, 25, 50, 100 };

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    for (SCORES) |score| {
        const routes = try findRoutes(arena.allocator(), score);
        std.debug.print("There are {} routes to the score {}.\n", .{ routes, score });
    }
}

fn findRoutes(allocator: std.mem.Allocator, score: u64) !u64 {
    if (score == 0) return 1;
    if (score == 1 or score == 2) return 0;

    const limit = score + 1;
    var routes_cache = try allocator.alloc(u64, limit);
    defer allocator.free(routes_cache);

    routes_cache[0] = 1;
    routes_cache[1] = 0;
    routes_cache[2] = 0;
    routes_cache[3] = 1;
    routes_cache[4] = 0;
    routes_cache[5] = 1;
    routes_cache[6] = 0;
    routes_cache[7] = 1;

    for (8..limit) |idx| {
        // NOTE: No need to check for bounds-checking due to guards above.
        routes_cache[idx] = routes_cache[idx - POINTS_PENALTY];
        routes_cache[idx] += routes_cache[idx - POINTS_TRY];
        routes_cache[idx] += routes_cache[idx - POINTS_CONVERSION];
    }

    return routes_cache[score];
}

const testing = std.testing;

test "one route to 0" {
    try testing.expectEqual(@as(u64, 1), findRoutes(testing.allocator, 0));
}

test "no routes to 1 or 2" {
    try testing.expectEqual(@as(u64, 0), findRoutes(testing.allocator, 1));
    try testing.expectEqual(@as(u64, 0), findRoutes(testing.allocator, 2));
}

test "one route to penalty" {
    try testing.expectEqual(@as(u64, 1), findRoutes(testing.allocator, POINTS_PENALTY));
}

test "one route to try" {
    try testing.expectEqual(@as(u64, 1), findRoutes(testing.allocator, POINTS_TRY));
}

test "one route to conversion" {
    try testing.expectEqual(@as(u64, 1), findRoutes(testing.allocator, POINTS_CONVERSION));
}

test "no stack overflow on high score" {
    _ = try findRoutes(testing.allocator, 100);
}
