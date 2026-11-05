/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// Surrogate pair range.

function isURIError(error: Error): boolean {
  return error instanceof URIError;
}

function main(): void {
  arktest.expectThrow((): void => { decodeURIComponent('%ED%A0%80'); }, isURIError);
  arktest.expectThrow((): void => { decodeURIComponent('%ED%AF%BF'); }, isURIError);
  arktest.expectThrow((): void => { decodeURIComponent('%ED%B0%80'); }, isURIError);
  arktest.expectThrow((): void => { decodeURIComponent('%ED%BF%BF'); }, isURIError);

  arktest.expectThrow((): void => { decodeURIComponent('%C1%BF'); }, isURIError);
  arktest.expectThrow((): void => { decodeURIComponent('%E0%9F%BF'); }, isURIError);
}
