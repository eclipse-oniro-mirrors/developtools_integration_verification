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

// arktsid: async_static_dflt_params_arg_val_undefined
// description: async method, explicit undefined triggers defaults, returns Promise
// source: async-method-static/dflt-params-arg-val-undefined.js

class C {
    static async method(fromLiteral: number = 23, fromExpr: number = 45, fromHole: number = 99): Promise<number> {
        arktest.assertEQ(fromLiteral, 23, 'first default parameter value');
        arktest.assertEQ(fromExpr, 45, 'second default parameter value');
        arktest.assertEQ(fromHole, 99, 'third default parameter value');
        return fromLiteral + fromExpr + fromHole;
    }
}

function main(): void {
    let p: Promise<number> = C.method(undefined, undefined);
    arktest.assertTrue(p instanceof Promise);
}
