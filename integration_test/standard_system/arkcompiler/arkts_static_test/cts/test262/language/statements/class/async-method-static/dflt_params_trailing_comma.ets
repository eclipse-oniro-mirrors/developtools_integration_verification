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

// arktsid: async_static_dflt_params_trailing_comma
// description: async method, trailing comma in params with default, returns Promise
// source: async-method-static/dflt-params-trailing-comma.js

class C {
    static async method(a: number, b: number = 39,): Promise<number> {
        arktest.assertEQ(a, 42, 'first parameter value');
        arktest.assertEQ(b, 39, 'second parameter value');
        return b;
    }
}

function main(): void {
    let p: Promise<number> = C.method(42, undefined);
    arktest.assertTrue(p instanceof Promise);
}
