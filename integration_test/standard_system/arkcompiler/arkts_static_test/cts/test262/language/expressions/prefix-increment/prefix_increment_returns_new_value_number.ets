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

// arktsid: prefix_increment_returns_new_value_number
// description: The prefix increment operator ++x returns the new (post-increment) value ToNumber(x) + 1

function main(): void {
    let x: double = 0.1;
    arktest.assertEQ(++x, 0.1 + 1);
}
