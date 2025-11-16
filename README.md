To test the performance of the solution, run the following:

```
hyperfine zig-out/bin/rugby --warmup 50 --runs 100 --shell none
```

It seems to have a mean execution duration of ~675 microseconds with the shell disabled.
