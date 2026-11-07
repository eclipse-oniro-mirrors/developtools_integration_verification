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

import { Popup, PopupTextOptions, PopupButtonOptions, PopupIconOptions } from '@kit.ArkUI';

@Entry
@Component
struct PopupMaxWidth0240 {
  aboutToAppear() {
    console.info('PopupMaxWidth0240 page aboutToAppear');
  }

  onPageShow() {
    console.info('PopupMaxWidth0240 page onPageShow');
  }

  onPageHide() {
    console.info('PopupMaxWidth0240 page onPageHide');
  }

  aboutToDisappear() {
    console.info('PopupMaxWidth0240 page aboutToDisappear');
  }

  build() {
    Row() {
      // popup 高级组件，设置maxWidth为400vp，测试多任务模式场景
      Popup({
        // 设置maxWidth为400vp
        maxWidth: '400vp',
        // PopupIconOptions类型设置图标内容
        icon: {
          image: $r('app.media.icon'),
          width: 32,
          height: 32,
          fillColor: Color.White,
          borderRadius: 16
        } as PopupIconOptions,
        // PopupTextOptions类型设置标题内容
        title: {
          text: '验证多任务模式下maxWidth为400vp',
          fontSize: 18,
          fontColor: Color.Black,
          fontWeight: FontWeight.Medium
        } as PopupTextOptions,
        // PopupTextOptions类型设置消息内容
        message: {
          text: 'maxWidth设置为400vp,切换为多任务模式时测试。测试会自动进入多任务界面,然后返回应用,验证高级组件显示正常,未越界。',
          fontSize: 14,
          fontColor: Color.Black
        } as PopupTextOptions,
        showClose: false,
        onClose: () => {
          console.info('close Button click');
        },
        // PopupButtonOptions类型设置按钮内容
        buttons: [{
          text: '确定',
          action: () => {
            console.info('confirm button click');
          },
          fontSize: 14,
          fontColor: Color.Black,
        },
        {
          text: '取消',
          action: () => {
            console.info('cancel button click');
          },
          fontSize: 14,
          fontColor: Color.Black
        },] as [PopupButtonOptions?, PopupButtonOptions?]
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}

