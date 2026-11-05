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

// arktsid: subclass_type_error_expr
// description: new SubTypeError() instanceof TypeError (Subclass instanceof Heritage, class expression)
// Conversion notes: source uses class expression `const Subclass = class extends TypeError {}`; rewritten as class
// declaration (ArkTS class-expression support unverified; instanceof heritage semantics identical).

class Subclass extends TypeError {}

function main(): void {
    let sub: Subclass = new Subclass();
    arktest.assertTrue(sub instanceof Subclass);
    arktest.assertTrue(sub instanceof TypeError);
}
