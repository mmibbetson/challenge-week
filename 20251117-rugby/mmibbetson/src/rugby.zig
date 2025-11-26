const std = @import("std");
const rugby = @import("rugby");

const POINT_VALUES = [_]u64{ 3, 5, 7 };
const ROUTES_KNOWN = comptime blk: {
    var max: u64 = 0;
    for (POINT_VALUES) |pv| {
        if (pv > max) max = pv;
    }

    var routes = [_]u64{0} ** (max + 1);
    routes[0] = 1;

    for (POINT_VALUES) |pv| {
        routes[pv] = 1;
    }

    break :blk routes;
};

pub fn findRoutes(allocator: std.mem.Allocator, score: u64) !u64 {
    const rk_ubound = ROUTES_KNOWN.len;
    if (score < rk_ubound) return ROUTES_KNOWN[score];

    const score_ubound = score + 1;
    var routes_cache = try allocator.alloc(u64, score_ubound);
    defer allocator.free(routes_cache);

    @memcpy(routes_cache[0..rk_ubound], &ROUTES_KNOWN);

    for (rk_ubound..score_ubound) |idx| {
        for (POINT_VALUES) |pv| {
            routes_cache[idx] += routes_cache[idx - pv];
        }
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
