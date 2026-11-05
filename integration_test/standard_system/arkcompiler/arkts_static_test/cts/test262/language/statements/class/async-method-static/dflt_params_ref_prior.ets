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

// arktsid: async_static_dflt_params_ref_prior
// description: async method, default references earlier parameter, returns Promise
// source: async-method-static/dflt-params-ref-prior.js

class C {
    static async method(x: number, y: number = x, z: number = y): Promise<number> {
        arktest.assertEQ(x, 3, 'first argument value');
        arktest.assertEQ(y, 3, 'second argument value');
        arktest.assertEQ(z, 3, 'third argument value');
        return z;
    }
}

function main(): void {
    let p: Promise<number> = C.method(3);
    arktest.assertTrue(p instanceof Promise);
}
