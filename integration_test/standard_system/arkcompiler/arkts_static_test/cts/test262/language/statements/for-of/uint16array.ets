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
// arktsid: uint16array
// description: Uint16Array traversal using for..of

function main(): void {
    let iterationCount: number = 0;
    let array: Uint16Array = new Uint16Array([3, 2, 4, 1]);
    let first: number = 3;
    let second: number = 2;
    let third: number = 4;
    let fourth: number = 1;
    for (const x of array) {
        arktest.assertEQ(Number(x), first);
        first = second;
        second = third;
        third = fourth;
        iterationCount += 1;
    }
    arktest.assertEQ(iterationCount, 4);
}
