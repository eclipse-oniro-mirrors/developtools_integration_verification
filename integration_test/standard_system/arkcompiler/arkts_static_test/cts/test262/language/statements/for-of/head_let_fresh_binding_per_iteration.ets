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
// arktsid: head_let_fresh_binding_per_iteration
// description: let ForDeclaration: creates a fresh binding per iteration

function main(): void {
    let s: number = 0;
    let f: (() => number)[] = [];
    for (let x of [1, 2, 3]) {
        s += x;
        f.push(() => x);
    }
    arktest.assertEQ(s, 6);
    arktest.assertEQ(f[0](), 1);
    arktest.assertEQ(f[1](), 2);
    arktest.assertEQ(f[2](), 3);
}
