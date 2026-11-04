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

// arktsid: methods_named_eval_arguments
// description: methods named eval/arguments (instance + static)

class C {
    eval(): number {
        return 1;
    }
    arguments(): number {
        return 2;
    }
    static eval(): number {
        return 3;
    }
    static arguments(): number {
        return 4;
    }
}

function main(): void {
    let c: C = new C();
    arktest.assertTrue(c.eval() === 1);
    arktest.assertTrue(c.arguments() === 2);
    arktest.assertTrue(C.eval() === 3);
    arktest.assertTrue(C.arguments() === 4);
}
