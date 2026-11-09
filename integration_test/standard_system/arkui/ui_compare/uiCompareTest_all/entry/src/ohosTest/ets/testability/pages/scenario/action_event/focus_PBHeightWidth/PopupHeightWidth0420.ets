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
import { image } from '@kit.ImageKit';
import { Popup, PopupIconOptions, PopupTextOptions, PopupButtonOptions, DrawableDescriptor, PixelMapDrawableDescriptor } from '@kit.ArkUI';

@Entry
@Component
struct PopupHeightWidth0420 {
  @State showPopup: boolean = false;
  @State rectangleDrawable: DrawableDescriptor | null = null;

  async aboutToAppear(): Promise<void> {
    console.info('===== 创建长方形DrawableDescriptor =====');
    
    try {
      // 创建长方形PixelMap (宽度 > 高度)
      const width = 120;
      const height = 60;
      const color: ArrayBuffer = new ArrayBuffer(width * height * 4);
      const colors = new Uint8Array(color);
      
      // 创建渐变效果的长方形图片
      for (let y = 0; y < height; y++) {
        for (let x = 0; x < width; x++) {
          const index = (y * width + x) * 4;
          // 渐变色从蓝到绿
          colors[index] = 0;                           // R
          colors[index + 1] = Math.floor((x / width) * 255);  // G (渐变)
          colors[index + 2] = Math.floor(255 - (x / width) * 255); // B (反向渐变)
          colors[index + 3] = 255;                     // A
        }
      }
      
      const opts: image.InitializationOptions = {
        size: { width: width, height: height },
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: false,
        alphaType: image.AlphaType.OPAQUE
      };
      
      const pixelMap: PixelMap = await image.createPixelMap(color, opts);
      console.info('长方形PixelMap创建成功, 尺寸: ' + width + 'x' + height);
      
      this.rectangleDrawable = new PixelMapDrawableDescriptor(pixelMap);
      console.info('长方形DrawableDescriptor创建成功!');
      
    } catch (error) {
      console.error('长方形DrawableDescriptor创建失败: ' + error.message);
      this.rectangleDrawable = null;
    }
  }

  @Builder
  popupBuilder() {
    Popup({
      icon: {
        image: this.rectangleDrawable !== null ? this.rectangleDrawable : $r('app.media.icon1')
      } as PopupIconOptions,
      message: {
        text: 'Popup内容 - 测试长方形图标自适应宽高'
      } as PopupTextOptions,
      buttons: [
        {
          text: '关闭',
          action: () => { this.showPopup = false; }
        } as PopupButtonOptions
      ]
    })
  }

  build() {
    Column({ space: 20 }) {
      Text(this.rectangleDrawable !== null ? '长方形DrawableDescriptor加载成功 ✓' : '加载中...')
        .fontSize(16)
        .fontColor(this.rectangleDrawable !== null ? Color.Green : Color.Orange)
      
      if (this.rectangleDrawable !== null) {
        Column({ space: 10 }) {
          Text('长方形图标预览 (120x60):')
            .fontSize(14)
            .fontColor(Color.Gray)
          
          Text('自适应显示效果:')
            .fontSize(12)
            .fontColor(Color.Gray)
          
          // 限制高度为50，宽度自动按比例缩放
          Image(this.rectangleDrawable)
            .height(50)
            .objectFit(ImageFit.Contain)
            .border({ width: 2, color: Color.Green })
            .backgroundColor('#f0f0f0')
        }
        .padding(10)
        .backgroundColor('#f5f5f5')
        .borderRadius(8)
      }
      
      Button('显示Popup')
        .id('showPopupButton0420')
        .onClick(() => {
          this.showPopup = !this.showPopup;
        })
        .margin(50)
        .bindContentCover(this.showPopup, this.popupBuilder)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
