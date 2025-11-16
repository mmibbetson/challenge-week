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
        const routes = try findRoutes(score, arena.allocator());
        std.debug.print("There are {} routes to the score {}.\n", .{ routes, score });
    }
}

fn findRoutes(score: u64, allocator: std.mem.Allocator) !u64 {
    if (score == 0) return 1;
    if (score == 1 or score == 2) return 0;

    const limit = score + 1;
    var routes_cache = try allocator.alloc(u64, limit);
    defer allocator.free(routes_cache);

    routes_cache[0] = 1;
    routes_cache[1] = 0;
    routes_cache[2] = 0;

    for (3..limit) |idx| {
        // NOTE: Guaranteed to always be >= 3 due to guards above.
        routes_cache[idx] = routes_cache[idx - POINTS_PENALTY];

        if (idx >= POINTS_TRY) {
            routes_cache[idx] += routes_cache[idx - POINTS_TRY];
        }

        if (idx >= POINTS_CONVERSION) {
            routes_cache[idx] += routes_cache[idx - POINTS_CONVERSION];
        }
    }

    return routes_cache[score];
}

const testing = std.testing;

test "one route to 0" {
    try testing.expectEqual(@as(u64, 1), findRoutes(0, testing.allocator));
}

test "no routes to 1 or 2" {
    try testing.expectEqual(@as(u64, 0), findRoutes(1, testing.allocator));
    try testing.expectEqual(@as(u64, 0), findRoutes(2, testing.allocator));
}

test "one route to penalty" {
    try testing.expectEqual(@as(u64, 1), findRoutes(POINTS_PENALTY, testing.allocator));
}

test "one route to try" {
    try testing.expectEqual(@as(u64, 1), findRoutes(POINTS_TRY, testing.allocator));
}

test "one route to conversion" {
    try testing.expectEqual(@as(u64, 1), findRoutes(POINTS_CONVERSION, testing.allocator));
}

test "no stack overflow on high score" {
    _ = try findRoutes(100, testing.allocator);
}
