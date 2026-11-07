/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Settings from './Settings'
import Logger from './Logger'
import Utils from './Utils'

/**
 * 公共测试辅助：跨用例重复逻辑抽取（任务C）。
 */
export class TestHelper {
  /**
   * 安全销毁浮窗并等待 500ms。
   * 与原 afterEach 内联实现行为等价：未建窗直接返回；建窗则
   * destroyWindow 回调（失败记日志）+ sleep(500)。
   */
  static async destroyWindow(): Promise<void> {
    if (Settings.windowClass == undefined) {
      return
    }
    Settings.windowClass.destroyWindow((err) => {
      if (err.code) {
        Logger.error('TEST', `Failed to destroy the window.Cause :${JSON.stringify(err)}`)
        return;
      }
      Logger.info('TEST', `Succeeded in destroy the window`);
    })
    await Utils.sleep(500)
  }
}

export default TestHelper
