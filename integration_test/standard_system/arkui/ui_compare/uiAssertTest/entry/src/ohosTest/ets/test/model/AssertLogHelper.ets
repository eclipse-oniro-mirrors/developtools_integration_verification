/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import hilog from '@ohos.hilog'
import { abilityDelegatorRegistry } from '@kit.TestKit'

/**
 * Lightweight log assert helper for non-screenshot suites.
 * Prefer page Text markers when device hilog capture is unavailable.
 */
export default class AssertLogHelper {
  static readonly DOMAIN: number = 0xFF00
  static readonly TAG: string = 'UiAssert'

  static info(msg: string): void {
    hilog.info(AssertLogHelper.DOMAIN, AssertLogHelper.TAG, '%{public}s', msg)
  }

  static containsIgnoreCase(haystack: string, needle: string): boolean {
    if (haystack.length == 0 || needle.length == 0) {
      return false
    }
    return haystack.toLowerCase().indexOf(needle.toLowerCase()) >= 0
  }

  /**
   * Best-effort: dump AbilityDelegator readiness for debugging.
   */
  static dumpDelegatorHint(): string {
    try {
      let delegator = abilityDelegatorRegistry.getAbilityDelegator()
      if (delegator == undefined) {
        return ''
      }
      return 'delegator_ready'
    } catch (e) {
      return ''
    }
  }
}
