/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: primitive_value_in_expression_position_of_templatemiddlelist_variant_2
// description: Primitive value in expression position of TemplateMiddleList

function main(): void {
    arktest.assertEQ(`${0} ${5} bar`, '0 5 bar', 'number value');
    arktest.assertEQ(`${0} ${'string'} bar`, '0 string bar', 'string value');
}
