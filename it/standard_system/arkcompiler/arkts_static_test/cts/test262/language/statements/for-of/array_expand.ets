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
// arktsid: array_expand
// description: Array entry insertion during traversal using for..of

function main(): void {
    let array: number[] = [0];
    let iterationCount: number = 0;
    let first: number = 0;
    let second: number | null = 1;
    for (const x of array) {
        arktest.assertEQ(x, first);
        if (second != null) {
            first = second;
            second = null;
            array.push(1);
        }
        iterationCount += 1;
    }
    arktest.assertEQ(iterationCount, 2);
}
