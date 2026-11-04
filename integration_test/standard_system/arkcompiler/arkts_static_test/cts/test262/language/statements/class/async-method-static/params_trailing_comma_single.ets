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

// arktsid: async_static_params_trailing_comma_single
// description: async method, trailing comma single param, returns Promise
// source: async-method-static/params-trailing-comma-single.js

class C {
    static async method(a: number,): Promise<number> {
        arktest.assertEQ(a, 42, 'parameter value');
        return a;
    }
}

function main(): void {
    let p: Promise<number> = C.method(42);
    arktest.assertTrue(p instanceof Promise);
}
