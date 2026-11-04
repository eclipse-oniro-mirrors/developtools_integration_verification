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
// arktsid: iteration_statement_while
// description: optional chain in test portion of while statement
// Conversion notes: while 条件 obj?.a；具名 interface Obj 承载对象字面量值，obj 非空使 ?. 条件为 boolean

interface Obj {
    a: boolean;
}

function main(): void {
    let count: number = 0;
    let obj: Obj = {a: true};
    while (obj?.a) {
        count++;
        break;
    }
    arktest.assertEQ(1, count);
}
