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

// arktsid: return_expression_yields_function_value
// description: A return expression yields the evaluated expression value (a function closure)

function ddOperator(f: (x: double) => double, delta: double): (x: double) => double {
    return (x: double): double => {
        return (f(x + delta) - 2.0 * f(x) + f(x - delta)) / (delta * delta);
    };
}

function main(): void {
    let ddSin: (x: double) => double = ddOperator((x: double): double => Math.sin(x), 0.00001);
    let value: double = ddSin(Math.PI / 2.0) + Math.sin(Math.PI / 2.0);
    arktest.assertTrue(value < 0.00001, 'second derivative of sin(x) at pi/2 is -sin(x)');
}
