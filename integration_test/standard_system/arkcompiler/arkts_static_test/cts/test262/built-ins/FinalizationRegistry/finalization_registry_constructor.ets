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
// arktsid: finalization_registry_constructor
// description: FinalizationRegistry constructor creates a registry with a cleanup callback

function main(): void {
    let target: Object = {};
    let called: boolean = false;

    // Create registry with a cleanup callback
    let fr = new FinalizationRegistry<Object>((heldValue: Object): void => {
        called = true;
    });

    // Register a target
    fr.register(target, 'held');

    // Unregister before GC
    fr.unregister(target);
    arktest.assertEQ(called, false);
}