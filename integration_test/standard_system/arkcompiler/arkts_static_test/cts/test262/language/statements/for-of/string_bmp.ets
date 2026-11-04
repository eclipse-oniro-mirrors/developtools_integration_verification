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
// arktsid: string_bmp
// description: String traversal using for..of

function main(): void {
    let s: string = 'abc';
    let first: string = 'a';
    let second: string = 'b';
    let third: string = 'c';
    let iterationCount: number = 0;
    for (const v of s) {
        arktest.assertEQ(v, first);
        first = second;
        second = third;
        iterationCount += 1;
    }
    arktest.assertEQ(iterationCount, 3);
}
