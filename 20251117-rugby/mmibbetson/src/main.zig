const std = @import("std");
const rugby = @import("rugby");

const POINTS_PENALTY = 3;
const POINTS_TRY = 5;
const POINTS_CONVERSION = 7;
const SCORES = [_]u64{ 100, 150, 195 };
const PREALLOCATED_SCORES = [_]u64{ 1, 0, 0, 1, 0, 1, 1, 1 };

// TODO: Make this accept a score as an arg instead.
pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    for (SCORES) |score| {
        const routes = try findRoutes(arena.allocator(), score);
        std.debug.print("There are {} routes to the score {}.\n", .{ routes, score });
    }
}

fn findRoutes(allocator: std.mem.Allocator, score: u64) !u64 {
    if (score < PREALLOCATED_SCORES.len) return PREALLOCATED_SCORES[score];

    const limit = score + 1;
    var routes_cache = try allocator.alloc(u64, limit);
    defer allocator.free(routes_cache);

    @memcpy(routes_cache[0..8], &PREALLOCATED_SCORES);

    for (8..limit) |idx| {
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
