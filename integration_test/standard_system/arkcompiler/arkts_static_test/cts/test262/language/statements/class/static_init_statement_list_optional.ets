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
// arktsid: static_init_statement_list_optional
// description: The block's statement list is optional
// conversion: 源 `class C { static {} }`（无断言，仅验证空 static 块合法）；探针实测 OK（compile+run）

class C {
    static {
    }
}

function main(): void {
    let c: C = new C();
    arktest.assertTrue(c instanceof C);
}
