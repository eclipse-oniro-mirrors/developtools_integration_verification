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

// arktsid: async_function_default_parameter_uses_prior
// description: A default parameter may reference an earlier parameter

async function ref(x: int, y: int = x, z: int = y): Promise<void> {
    arktest.assertEQ(x, 3);
    arktest.assertEQ(y, 3);
    arktest.assertEQ(z, 3);
}

function main(): void {
    ref(3);
}
