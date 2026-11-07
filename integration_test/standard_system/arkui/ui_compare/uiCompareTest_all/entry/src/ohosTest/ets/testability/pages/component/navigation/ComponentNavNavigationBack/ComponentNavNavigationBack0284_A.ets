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
import { image } from '@kit.ImageKit'
import fileio from '@ohos.fileio';
@Entry
@Component
export struct ComponentNavNavigationBack0284A {
  @Consume('pageInfos') pageInfos: NavPathStack
  @State backButtonIcon:string | PixelMap | Resource= 'AAA'
  build() {
    NavDestination() {
      Column() {
        Button('NextPage', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigationBack0284_A1')
          .onClick(() => {
            this.pageInfos.pushPathByName('pageTwo', null) //将name指定的NavDestination页面信息入栈，传递的数据为param
          })
        Button('backButtonIcon', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .id('ComponentNavNavigationBack0284_A2')
          .onClick(() => {
            this.loadGifIcon();
          })
      }.width('100%').height('100%')
    }.title('pageOne')
    .backButtonIcon(this.backButtonIcon)
    .mode(NavDestinationMode.STANDARD)
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
    .backgroundColor(Color.White)
  }

  async loadGifIcon() {
    try {
      const filePath = ('https://' + 'docimg9.docs.qq.com' + '/image/AgAABd3lbMrG1njr_7dKwYs9RKdNxYEz.png?w=114&h=114');
      fileio.opendir(filePath); // 打开文件
      const color = new ArrayBuffer(96); // 96 为需要创建的像素 buffer 大小
      // 创建 PixelMap
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      const pixelMap = await image.createPixelMap(color, opts); // 创建 PixelMap
      this.backButtonIcon = pixelMap; // 将 PixelMap 赋值给状态变量
      fileio.close; // 关闭文件描述符
    } catch (error) {
      console.error('Failed to load GIF icon:', error);
    }
  }
}

export { ComponentNavNavigationBack0284A }

