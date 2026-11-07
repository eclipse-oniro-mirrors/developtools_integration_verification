/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/**
 * 目标页面 - 用于路由跳转测试
 */
import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
export struct RoutingNamedroutesDfx31 {
  @Local params: Record<string, Object> = {};

  aboutToAppear(): void {
    this.params = router.getParams() as Record<string, Object>;
  }

  build() {
    Column() {
      Text('目标页面 31')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 20 })

      Text(`来源: ${this.params['source'] || '未知'}`)
        .fontSize(16)
        .fontColor('#666')
        .margin({ bottom: 30 })

      Button('返回')
        .width('80%')
        .onClick(() => {
          router.back();
        })
        .id('btn')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
