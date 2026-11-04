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
// arktsid: argument_by_value
// description: Passing arguments by value differs from by reference and do not change values to be passed
// Conversion notes: function addFirst2Second 顶层辅助函数（先例 arguments_object_unsupported_n.ets）；int 按值传参、形参 first += second
// 自增不影响实参

function addFirst2Second(first: int, second: int): void {
    first += second;
}

function main(): void {
    let n: int = 1;
    let m: int = n;
    addFirst2Second(n, m);
    arktest.assertEQ(m, 1);
}