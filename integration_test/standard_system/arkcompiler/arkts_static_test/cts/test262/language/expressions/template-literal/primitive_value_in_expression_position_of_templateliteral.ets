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

// arktsid: primitive_value_in_expression_position_of_templateliteral
// description: Primitive value in expression position of TemplateLiteral

function main(): void {
    arktest.assertEQ(`foo ${5} bar`, 'foo 5 bar', 'number value');
    arktest.assertEQ(`foo ${'string'} bar`, 'foo string bar', 'string value');
}
