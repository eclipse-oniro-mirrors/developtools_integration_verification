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
// arktsid: array_expand_contract
// description: Array entry insertion and removal items during traversal using for..of

function main(): void {
    let array: number[] = [0];
    let iterationCount: number = 0;
    for (const x of array) {
        arktest.assertEQ(x, 0);
        array.push(1);
        array.pop();
        iterationCount += 1;
    }
    arktest.assertEQ(iterationCount, 1);
}
