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

// arktsid: decodeuri_invalid_percent_throws
// description: decodeURI throws URIError for incomplete percent sequences
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let c0: boolean = false; try { decodeURI('%'); } catch (e) { c0 = true; }
    arktest.assertTrue(c0, 'decodeURI(\'%\') throws');
    let c1: boolean = false; try { decodeURI('%A'); } catch (e) { c1 = true; }
    arktest.assertTrue(c1, 'decodeURI(\'%A\') throws');
    let c2: boolean = false; try { decodeURI('%1'); } catch (e) { c2 = true; }
    arktest.assertTrue(c2, 'decodeURI(\'%1\') throws');
    let c3: boolean = false; try { decodeURI('% '); } catch (e) { c3 = true; }
    arktest.assertTrue(c3, 'decodeURI(\'% \') throws');
}