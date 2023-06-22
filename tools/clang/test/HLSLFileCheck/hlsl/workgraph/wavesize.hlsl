// RUN: %dxc -T lib_6_8 %s | FileCheck %s

// Check the WaveSize attribute is accepted by work graph nodes
// and appears in the metadata

[shader("compute")]
[Shader("node")]
[NodeLaunch("broadcasting")]
[NumThreads(1,1,1)]
[WaveSize(4)]
void node01() { }

// CHECK: !{void ()* @node01, !"node01", null, null, [[NODE01:![0-9]+]]}
// CHECK: [[NODE01]] = !{i32 8, i32 5, i32 13, i32 1, i32 11, [[NODE01_WS:![0-9]+]]
// CHECK: [[NODE01_WS]] = !{i32 4}

[Shader("node")]
[NodeLaunch("broadcasting")]
[NumThreads(1,1,1)]
[WaveSize(8)]
void node02() { }

// CHECK: !{void ()* @node02, !"node02", null, null, [[NODE02:![0-9]+]]}
// CHECK: [[NODE02]] = !{i32 8, i32 15, i32 13, i32 1, i32 11, [[NODE02_WS:![0-9]+]]
// CHECK: [[NODE02_WS]] = !{i32 8}

[Shader("node")]
[NodeLaunch("coalescing")]
[NumThreads(1,1,1)]
[WaveSize(16)]
void node03() { }

// CHECK: !{void ()* @node03, !"node03", null, null, [[NODE03:![0-9]+]]}
// CHECK: [[NODE03]] = !{i32 8, i32 15, i32 13, i32 2, i32 11, [[NODE03_WS:![0-9]+]]
// CHECK: [[NODE03_WS]] = !{i32 16}

[Shader("node")]
[NodeLaunch("thread")]
[WaveSize(32)]
void node04() { }

// CHECK: !{void ()* @node04, !"node04", null, null, [[NODE04:![0-9]+]]}
// CHECK: [[NODE04]] = !{i32 8, i32 15, i32 13, i32 3, i32 11, [[NODE04_WS:![0-9]+]]
// CHECK: [[NODE04_WS]] = !{i32 32}