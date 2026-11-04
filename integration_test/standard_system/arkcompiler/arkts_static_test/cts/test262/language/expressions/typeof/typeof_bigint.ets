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

// arktsid: typeof_bigint
// description: typeof BigInt literal and BigInt() result === "bigint"
// Conversion notes: The "typeof Object(BigInt(...)) === 'object'" boxing cases are dropped because ArkTS has no
// Object()
// boxing call.

function main(): void {
    arktest.assertEQ(typeof 0n, 'bigint');
    arktest.assertEQ(typeof BigInt(0n), 'bigint');
}