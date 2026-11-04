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

// arktsid: grammar_field_classelementname_initializer_alt
// description: fields named $ / _ / o / \u2118 / ZW_<ZWNJ>_NJ / ZW_<ZWJ>_J with initializers
// source: valid/grammar-field-classelementname-initializer-alt.js

class C {
    $ = 1;
    _ = 2;
    o = 3;
    ℘ = 4;
    ZW_‌_NJ = 5;
    ZW_‍_J = 6;
}

function main(): void {
    let c: C = new C();
    arktest.assertTrue(c.$ === 1);
    arktest.assertTrue(c._ === 2);
    arktest.assertTrue(c.o === 3);
    arktest.assertTrue(c.℘ === 4);
    arktest.assertTrue(c.ZW_‌_NJ === 5);
    arktest.assertTrue(c.ZW_‍_J === 6);
}
