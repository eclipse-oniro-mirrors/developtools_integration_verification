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

// arktsid: in_getter
// description: super.x property access + super.method() call inside an instance getter

class B {
    method(): number {
        return 1;
    }
    get x(): number {
        return 2;
    }
}

class C extends B {
    get y(): number {
        arktest.assertTrue(super.x === 2);
        return super.method();
    }
}

function main(): void {
    let c: C = new C();
    arktest.assertTrue(c.y === 1);
}
