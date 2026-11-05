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

// arktsid: prefix_decrement_basic
// description: The prefix decrement operator --x uses GetValue and PutValue on a number variable: it decrements the
// variable and returns the new value

function main(): void {
    let x: int = 1;
    arktest.assertEQ(--x, 1 - 1);
    arktest.assertEQ(x, 1 - 1);
}