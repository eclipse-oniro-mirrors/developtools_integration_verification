/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: bitwise_not_special_values
// description: Bitwise not on NaN — ToInt32(NaN) = 0, so ~NaN yields -1
// Conversion notes: kept CHECK#3 (~NaN === -1) from S11.4.8_A3_T2.js,
// verified on es2panda (2026-08-14): ~Double.NaN === -1 PASS.
// DIVERGENCE (also verified): ~±Infinity does NOT follow JS ToInt32. ArkTS ~ on
// a double operand casts via a saturating double→long first: +Infinity →
// Long.MAX_VALUE → ~ gives Long.MIN_VALUE (-9223372036854775808); -Infinity →
// Long.MIN_VALUE → ~ gives Long.MAX_VALUE (9223372036854775807). JS expects
// ToInt32(±Infinity)=+0 → -1 for both, so those two checks were dropped.
// CHECK#1 (~0.1) / CHECK#5 (~1) already covered by use_operator.ets /
// either_type_x_is_not_reference... . new Number() wrapper checks unmigratable.

function main(): void {
    // CHECK#3: ~NaN === -1
    arktest.assertEQ(~Double.NaN, -1);
}
