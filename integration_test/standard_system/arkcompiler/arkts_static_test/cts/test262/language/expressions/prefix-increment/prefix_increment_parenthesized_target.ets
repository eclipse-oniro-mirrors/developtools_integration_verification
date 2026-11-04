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

// arktsid: prefix_increment_parenthesized_target
// description: A parenthesized identifier is a valid update target for the prefix increment operator

function main(): void {
    let y: int = 1;
    ++(y);
    arktest.assertEQ(y, 2);

    ++((y));
    arktest.assertEQ(y, 3);
}
