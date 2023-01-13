参考: https://qiita.com/tamaki/items/02eb43253193b950b08

## シミュレータ起動

`xcrun simctl boot <device-identifier>`

https://user-images.githubusercontent.com/16571394/212431666-612a15a9-1908-4bcf-9c4a-a07576ff952a.mov

## アプリインストール

`xcrun simctl install <device-identifier> <app-path>`

https://user-images.githubusercontent.com/16571394/212430163-98a840f3-b716-4aa5-845f-4685b2719ac4.mov

## アプリアンインストール

`xcrun simctl uninstall <device-identifier> <app.identifier>`

https://user-images.githubusercontent.com/16571394/212430394-03b8aa7b-9486-4da6-a0ad-2eefb3e928a9.mov

## アプリ起動

`xcrun simctl launch <device-identifier> <app.identifier>`

https://user-images.githubusercontent.com/16571394/212430700-6aecb665-490f-4ed4-b667-7e3335751d99.mov

## スクリーンショット撮影

`xcrun simctl io booted screenshot <image-path>`

https://user-images.githubusercontent.com/16571394/212431238-46b6de33-73d6-4ef8-ac23-eb9d8f187a8c.mov

## アプリを起動し、スクリーンショットを撮影

ちょっと見切れた感じ

`xcrun simctl launch <device-identifier> <app.identifier> && xcrun simctl io booted screenshot <image-path>`

https://user-images.githubusercontent.com/16571394/212432663-b2bab8ab-4089-4919-9dd2-8ef34bc8ee6d.mov

### 撮影した写真

<img src="https://user-images.githubusercontent.com/16571394/212432686-390c2461-f823-4c68-9186-0b88e57dcb38.png" width="240">

## デバイス一覧取得

```
$ xcrun simctl list
== Device Types ==
iPhone 4s (com.apple.CoreSimulator.SimDeviceType.iPhone-4s)
iPhone 5 (com.apple.CoreSimulator.SimDeviceType.iPhone-5)
iPhone 5s (com.apple.CoreSimulator.SimDeviceType.iPhone-5s)
iPhone 6 Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus)
iPhone 6 (com.apple.CoreSimulator.SimDeviceType.iPhone-6)
iPhone 6s (com.apple.CoreSimulator.SimDeviceType.iPhone-6s)
iPhone 6s Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-6s-Plus)
iPhone SE (1st generation) (com.apple.CoreSimulator.SimDeviceType.iPhone-SE)
iPhone 7 (com.apple.CoreSimulator.SimDeviceType.iPhone-7)
iPhone 7 Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-7-Plus)
iPhone 8 (com.apple.CoreSimulator.SimDeviceType.iPhone-8)
iPhone 8 Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-8-Plus)
iPhone X (com.apple.CoreSimulator.SimDeviceType.iPhone-X)
iPhone Xs (com.apple.CoreSimulator.SimDeviceType.iPhone-XS)
iPhone Xs Max (com.apple.CoreSimulator.SimDeviceType.iPhone-XS-Max)
iPhone Xʀ (com.apple.CoreSimulator.SimDeviceType.iPhone-XR)
iPhone 11 (com.apple.CoreSimulator.SimDeviceType.iPhone-11)
iPhone 11 Pro (com.apple.CoreSimulator.SimDeviceType.iPhone-11-Pro)
iPhone 11 Pro Max (com.apple.CoreSimulator.SimDeviceType.iPhone-11-Pro-Max)
iPhone SE (2nd generation) (com.apple.CoreSimulator.SimDeviceType.iPhone-SE--2nd-generation-)
iPhone 12 mini (com.apple.CoreSimulator.SimDeviceType.iPhone-12-mini)
iPhone 12 (com.apple.CoreSimulator.SimDeviceType.iPhone-12)
iPhone 12 Pro (com.apple.CoreSimulator.SimDeviceType.iPhone-12-Pro)
iPhone 12 Pro Max (com.apple.CoreSimulator.SimDeviceType.iPhone-12-Pro-Max)
iPhone 13 Pro (com.apple.CoreSimulator.SimDeviceType.iPhone-13-Pro)
iPhone 13 Pro Max (com.apple.CoreSimulator.SimDeviceType.iPhone-13-Pro-Max)
iPhone 13 mini (com.apple.CoreSimulator.SimDeviceType.iPhone-13-mini)
iPhone 13 (com.apple.CoreSimulator.SimDeviceType.iPhone-13)
iPhone SE (3rd generation) (com.apple.CoreSimulator.SimDeviceType.iPhone-SE-3rd-generation)
iPod touch (7th generation) (com.apple.CoreSimulator.SimDeviceType.iPod-touch--7th-generation-)
iPad 2 (com.apple.CoreSimulator.SimDeviceType.iPad-2)
iPad Retina (com.apple.CoreSimulator.SimDeviceType.iPad-Retina)
iPad Air (com.apple.CoreSimulator.SimDeviceType.iPad-Air)
iPad mini 2 (com.apple.CoreSimulator.SimDeviceType.iPad-mini-2)
iPad mini 3 (com.apple.CoreSimulator.SimDeviceType.iPad-mini-3)
iPad mini 4 (com.apple.CoreSimulator.SimDeviceType.iPad-mini-4)
iPad Air 2 (com.apple.CoreSimulator.SimDeviceType.iPad-Air-2)
iPad Pro (9.7-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--9-7-inch-)
iPad Pro (12.9-inch) (1st generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro)
iPad (5th generation) (com.apple.CoreSimulator.SimDeviceType.iPad--5th-generation-)
iPad Pro (12.9-inch) (2nd generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--12-9-inch---2nd-generation-)
iPad Pro (10.5-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--10-5-inch-)
iPad (6th generation) (com.apple.CoreSimulator.SimDeviceType.iPad--6th-generation-)
iPad (7th generation) (com.apple.CoreSimulator.SimDeviceType.iPad--7th-generation-)
iPad Pro (11-inch) (1st generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--11-inch-)
iPad Pro (12.9-inch) (3rd generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--12-9-inch---3rd-generation-)
iPad Pro (11-inch) (2nd generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--11-inch---2nd-generation-)
iPad Pro (12.9-inch) (4th generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--12-9-inch---4th-generation-)
iPad mini (5th generation) (com.apple.CoreSimulator.SimDeviceType.iPad-mini--5th-generation-)
iPad Air (3rd generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Air--3rd-generation-)
iPad (8th generation) (com.apple.CoreSimulator.SimDeviceType.iPad--8th-generation-)
iPad (9th generation) (com.apple.CoreSimulator.SimDeviceType.iPad-9th-generation)
iPad Air (4th generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Air--4th-generation-)
iPad Pro (11-inch) (3rd generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro-11-inch-3rd-generation)
iPad Pro (12.9-inch) (5th generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro-12-9-inch-5th-generation)
iPad Air (5th generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Air-5th-generation)
iPad mini (6th generation) (com.apple.CoreSimulator.SimDeviceType.iPad-mini-6th-generation)
Apple TV (com.apple.CoreSimulator.SimDeviceType.Apple-TV-1080p)
Apple TV 4K (com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-4K)
Apple TV 4K (at 1080p) (com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-1080p)
Apple TV 4K (2nd generation) (com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-2nd-generation-4K)
Apple TV 4K (at 1080p) (2nd generation) (com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-2nd-generation-1080p)
Apple Watch - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-38mm)
Apple Watch - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-42mm)
Apple Watch Series 2 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-38mm)
Apple Watch Series 2 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-42mm)
Apple Watch Series 3 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-38mm)
Apple Watch Series 3 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-42mm)
Apple Watch Series 4 - 40mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-4-40mm)
Apple Watch Series 4 - 44mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-4-44mm)
Apple Watch Series 5 - 40mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-5-40mm)
Apple Watch Series 5 - 44mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-5-44mm)
Apple Watch SE - 40mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-SE-40mm)
Apple Watch SE - 44mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-SE-44mm)
Apple Watch Series 6 - 40mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-6-40mm)
Apple Watch Series 6 - 44mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-6-44mm)
Apple Watch Series 7 - 41mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-7-41mm)
Apple Watch Series 7 - 45mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-7-45mm)
== Runtimes ==
iOS 14.2 (14.2 - 18B79) - com.apple.CoreSimulator.SimRuntime.iOS-14-2
iOS 15.5 (15.5 - 19F70) - com.apple.CoreSimulator.SimRuntime.iOS-15-5
iOS 15.5 (15.5 - 19F70) - com.apple.CoreSimulator.SimRuntime.iOS-15-5
tvOS 15.4 (15.4 - 19L439) - com.apple.CoreSimulator.SimRuntime.tvOS-15-4
watchOS 8.5 (8.5 - 19T241) - com.apple.CoreSimulator.SimRuntime.watchOS-8-5
== Devices ==
-- iOS 14.2 --
    iPhone 8 (E36D7DEC-9BED-4267-9A78-XXXXXXXXXXXX) (Booted) 
    iPhone 8 Plus (XXXXXXXXXXXX-AFFD-4542-B7D6-14436083AB2A) (Shutdown) 
    iPhone 11 (1434A48B-08C8-4530-80D6-XXXXXXXXXXXX) (Shutdown) 
    iPhone 11 Pro (877322E8-0CFC-4C4C-981B-XXXXXXXXXXXX) (Shutdown) 
    iPhone 11 Pro Max (3D3F3FF9-CBB2-4691-8F66-XXXXXXXXXXXX) (Shutdown) 
    iPhone SE (2nd generation) (XXXXXXXXXXXX-DDA9-471B-A148-DD2E7BAB0B26) (Shutdown) 
    iPhone 12 mini (E45E8F8D-C364-4DC8-8BDD-XXXXXXXXXXXX) (Shutdown) 
    iPhone 12 (94615799-5D0B-4B6A-841B-XXXXXXXXXXXX) (Shutdown) 
    iPhone 12 Pro (F03C5306-0DFD-4AC4-AE3C-XXXXXXXXXXXX) (Shutdown) 
    iPhone 12 Pro Max (0668D12B-87FC-4A22-9ED1-XXXXXXXXXXXX) (Shutdown) 
    iPod touch (7th generation) (XXXXXXXXXXXX-5B65-4F6E-AA6C-FD75003C82E3) (Shutdown) 
    iPad Pro (9.7-inch) (FCD76094-2AE5-42EE-B422-XXXXXXXXXXXX) (Shutdown) 
    iPad Pro (11-inch) (2nd generation) (XXXXXXXXXXXX-DB53-452B-945D-CCF78BC7B91C) (Shutdown) 
    iPad Pro (12.9-inch) (4th generation) (XXXXXXXXXXXX-E8AA-4719-BA2C-9926EDC7007F) (Shutdown) 
    iPad (8th generation) (B671438B-77DF-4687-896E-XXXXXXXXXXXX) (Shutdown) 
    iPad Air (4th generation) (C5168932-1629-4B39-B85A-XXXXXXXXXXXX) (Shutdown) 
-- iOS 15.5 --
-- iOS 15.5 --
    iPhone 8 (5A1FC929-7FF8-4FEF-A55F-XXXXXXXXXXXX) (Shutdown) 
    iPhone 8 Plus (9473F581-8651-4EC5-A216-XXXXXXXXXXXX) (Shutdown) 
    iPhone 11 (9669D2E4-FE9F-41BA-A4E0-XXXXXXXXXXXX) (Shutdown) 
    iPhone 11 Pro (4CC3C61A-9DB4-4F4C-BA9B-XXXXXXXXXXXX) (Shutdown) 
    iPhone 11 Pro Max (XXXXXXXXXXXX-508D-4663-8B55-CAB9CA8114A1) (Shutdown) 
    iPhone SE (2nd generation) (XXXXXXXXXXXX-6F2C-4225-A00A-7B6093232AA6) (Shutdown) 
    iPhone 12 mini (754BEC6F-273E-4936-ADE5-XXXXXXXXXXXX) (Shutdown) 
    iPhone 12 (A2A5720C-E93C-4C70-86E5-XXXXXXXXXXXX) (Shutdown) 
    iPhone 12 Pro (XXXXXXXXXXXX-E34F-499B-B364-B30F68BFB300) (Shutdown) 
    iPhone 12 Pro Max (XXXXXXXXXXXX-9F78-469F-A1D3-AB659A022A69) (Shutdown) 
    iPhone 13 Pro (XXXXXXXXXXXX-67BD-4D9D-BCB9-CC95921B9521) (Shutdown) 
    iPhone 13 Pro Max (XXXXXXXXXXXX-E66A-41A5-9EB7-14BE9DFC07F4) (Shutdown) 
    iPhone 13 mini (774554EA-9682-4BF7-9CA6-XXXXXXXXXXXX) (Shutdown) 
    iPhone 13 (99C6BF6D-5127-4B45-AF8F-XXXXXXXXXXXX) (Shutdown) 
    iPhone SE (3rd generation) (DC49AE10-ED29-4CA7-B4BE-XXXXXXXXXXXX) (Shutdown) 
    iPod touch (7th generation) (528A25CD-E282-49D9-BF71-XXXXXXXXXXXX) (Shutdown) 
    iPad Pro (9.7-inch) (75269D15-F083-463E-8287-XXXXXXXXXXXX) (Shutdown) 
    iPad (9th generation) (4F04E69C-972B-4223-A932-XXXXXXXXXXXX) (Shutdown) 
    iPad Air (4th generation) (859F4ED9-6077-413C-B696-XXXXXXXXXXXX) (Shutdown) 
    iPad Pro (11-inch) (3rd generation) (549355F3-946A-409A-A6F3-XXXXXXXXXXXX) (Shutdown) 
    iPad Pro (12.9-inch) (5th generation) (446B3C48-12BB-4216-B45D-XXXXXXXXXXXX) (Shutdown) 
    iPad Air (5th generation) (98202F0A-9086-4E36-8D53-XXXXXXXXXXXX) (Shutdown) 
    iPad mini (6th generation) (EAAEAA67-2815-4917-ACE6-XXXXXXXXXXXX) (Shutdown) 
-- tvOS 15.4 --
    Apple TV (FD870160-E8C8-435A-9584-XXXXXXXXXXXX) (Shutdown) 
    Apple TV 4K (2nd generation) (52CA0839-C4D5-4F1A-B897-XXXXXXXXXXXX) (Shutdown) 
    Apple TV 4K (at 1080p) (2nd generation) (3A4234F9-3612-453C-A8BA-XXXXXXXXXXXX) (Shutdown) 
-- watchOS 8.5 --
    Apple Watch Series 5 - 40mm (DFDDDF06-5811-4843-A49A-XXXXXXXXXXXX) (Shutdown) 
    Apple Watch Series 5 - 44mm (70A6FEBD-5515-4EE4-BFDA-XXXXXXXXXXXX) (Shutdown) 
    Apple Watch Series 6 - 40mm (89D79986-4D09-4907-A569-XXXXXXXXXXXX) (Shutdown) 
    Apple Watch Series 6 - 44mm (6BDB00EA-2721-48D9-A051-XXXXXXXXXXXX) (Shutdown) 
    Apple Watch Series 7 - 41mm (46A7B584-2578-437E-A0E0-XXXXXXXXXXXX) (Shutdown) 
    Apple Watch Series 7 - 45mm (4BA1B51F-C0F7-41EF-9C75-XXXXXXXXXXXX) (Shutdown) 
-- Unavailable: com.apple.CoreSimulator.SimRuntime.iOS-15-0 --
    iPhone 8 (CD587B5B-A8FD-4558-9046-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 8 Plus (A83FF3B8-A5FE-4ED9-AA1E-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 11 (62B65B73-0E37-4CF8-8680-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 11 Pro (727919B1-653B-48AF-B78A-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 11 Pro Max (F422AF7B-35DB-40B9-B0D5-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone SE (2nd generation) (70A1618E-B8FC-4171-9621-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 12 mini (30163BCF-20D6-44DD-A620-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 12 (70514496-7166-4000-9CE5-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 12 Pro (49E00EF6-519D-41B0-9D7C-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 12 Pro Max (B2F01B3E-C593-4656-A19D-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 13 Pro (FCE87CE8-38EF-4A9B-972A-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 13 Pro Max (B3D45978-3FCC-456A-85D1-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 13 mini (3850256F-30C8-4DC5-9B9E-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 13 (6E0E655E-0C56-4C15-AAF3-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPod touch (7th generation) (254D7A8C-BBB8-4BB3-B256-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad Pro (9.7-inch) (5435AC9F-531D-4A69-BFFF-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad (9th generation) (898E3B05-7076-42CB-9315-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad Air (4th generation) (6E26D74A-DC38-4F8B-8748-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad Pro (11-inch) (3rd generation) (A1871BE3-C8D5-4C3A-956D-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad Pro (12.9-inch) (5th generation) (XXXXXXXXXXXX-E171-40XXXXXXXXXXXX35-B63A-E7DAC11F5872) (Shutdown) (unavailable, runtime profile not found)
    iPad mini (6th generation) (9C0859A0-93C0-4ECC-B2B1-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
-- Unavailable: com.apple.CoreSimulator.SimRuntime.iOS-16-0 --
    iPhone 8 (7B75D5AA-5A8E-4E32-9FCF-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 8 Plus (1D1F0F5F-15D2-XXXXXXXXXXXX-XXXXXXXXXXXX-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 11 (8D5A6438-0CFD-430B-A291-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 11 Pro (2A38FB99-F2DA-441A-878C-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 11 Pro Max (80BE6D2E-B2EB-461F-A47F-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone SE (2nd generation) (852C22D6-F311-41C0-B1F1-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 12 mini (B35B3199-5EA1-42AA-9A15-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 12 (D71DF52D-99DB-4F54-B7FB-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 12 Pro (843F26DA-E55F-4C11-8602-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 12 Pro Max (E7ED021D-BBB5-439C-84FD-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 13 Pro (3F7D47FF-6DC9-44E6-A7C2-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 13 Pro Max (E3F4747D-A50A-4C27-BC1B-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 13 mini (D8064CA7-F228-4513-A8DA-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 13 (DAFFDD26-4529-4A65-9E36-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone SE (3rd generation) (2AC670FF-8D2D-40F5-A969-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPod touch (7th generation) (7DC88B38-ADB3-4C14-AD1A-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad Pro (9.7-inch) (08ED55F4-3C8C-4D48-B3F6-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad (9th generation) (9B16E5A7-484F-43D5-804B-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad Air (4th generation) (FECF2A5A-4753-453D-9E1A-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad Pro (11-inch) (3rd generation) (32CC068E-1A67-4732-A11B-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad Pro (12.9-inch) (5th generation) (2FB3D78E-4973-4B20-88ED-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad Air (5th generation) (DD787F3D-2A86-4938-BFD0-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPad mini (6th generation) (B034F193-7FD0-47C5-9AE1-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 14 (61D70573-40F1-4B9C-AA67-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 14 Plus (28A1CFA2-9840-48D2-A121-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 14 Pro (4D7FB25A-E5EA-4FAE-B3F1-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    iPhone 14 Pro Max (XXXXXXXXXXXX-8F89-4E88-818D-C8E35D6A9EEC) (Shutdown) (unavailable, runtime profile not found)
-- Unavailable: com.apple.CoreSimulator.SimRuntime.tvOS-15-0 --
    Apple TV (0726583C-B9F5-41F5-8780-4705C6F131EA) (Shutdown) (unavailable, runtime profile not found)
    Apple TV 4K (2nd generation) (82F573ED-C2E5-4D61-B8B9-4991DEEDEF1B) (Shutdown) (unavailable, runtime profile not found)
    Apple TV 4K (at 1080p) (2nd generation) (A51A5396-7442-4940-927E-CC6BEA441B82) (Shutdown) (unavailable, runtime profile not found)
-- Unavailable: com.apple.CoreSimulator.SimRuntime.watchOS-8-0 --
    Apple Watch Series 5 - 40mm (XXXXXXXXXXXX-13FA-461B-8C9E-1F87F1C63D6C) (Shutdown) (unavailable, runtime profile not found)
    Apple Watch Series 5 - 44mm (23BA5F2F-6B1D-XXXXXXXXXXXX-550381B1F435) (Shutdown) (unavailable, runtime profile not found)
    Apple Watch Series 6 (40mm) (98F758F4-A4F3-4B9F-93AF-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    Apple Watch Series 6 (44mm) (01AD0AF2-A899-4385-9B85-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    Apple Watch Series 7 - 41mm (D9425E14-88BF-4870-896D-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
    Apple Watch Series 7 (45mm) (0B8B611C-0306-4EF8-86D3-XXXXXXXXXXXX) (Shutdown) (unavailable, runtime profile not found)
== Device Pairs ==
4791B7DF-D08C-426B-A6C0-57A64291BDB5 (active, disconnected)
    Watch: Apple Watch Series 5 - 40mm (DFDDDF06-5811-4843-A49A-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 12 mini (754BEC6F-273E-4936-ADE5-XXXXXXXXXXXX) (Shutdown)
F093A9ED-020F-40E1-95E5-B585480F1613 (active, disconnected)
    Watch: Apple Watch Series 5 - 44mm (70A6FEBD-5515-4EE4-BFDA-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 12 Pro (261F5208-E34F-499B-B364-XXXXXXXXXXXX) (Shutdown)
7CD41ABD-BACF-419F-AEFD-B0580236E4B3 (active, disconnected)
    Watch: Apple Watch Series 6 - 40mm (89D79986-4D09-4907-A569-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 13 Pro (0659DA7A-67BD-4D9D-BCB9-XXXXXXXXXXXX) (Shutdown)
7F8A7D52-9404-435B-9481-0F05F2643893 (active, disconnected)
    Watch: Apple Watch Series 6 - 44mm (6BDB00EA-2721-48D9-A051-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 13 Pro Max (9BFD5FBB-E66A-41A5-9EB7-XXXXXXXXXXXX) (Shutdown)
B0E9DE69-40F8-4FF9-9EB3-7FF585CE2762 (active, disconnected)
    Watch: Apple Watch Series 7 - 41mm (46A7B584-2578-437E-A0E0-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 13 mini (774554EA-9682-4BF7-9CA6-XXXXXXXXXXXX) (Shutdown)
6F14C27A-A53A-4C28-80AC-9E292A4D62E5 (active, disconnected)
    Watch: Apple Watch Series 7 - 45mm (4BA1B51F-C0F7-41EF-9C75-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 13 (99C6BF6D-5127-4B45-AF8F-XXXXXXXXXXXX) (Shutdown)
AC162307-7138-4CB0-A0F3-F27650AE9285 (unavailable)
    Watch: Apple Watch Series 5 - 40mm (69C87158-13FA-461B-8C9E-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 12 (70514496-7166-4000-9CE5-XXXXXXXXXXXX) (Shutdown)
6BE0CF00-CAB6-47E2-B00E-A3281009CE93 (unavailable)
    Watch: Apple Watch Series 6 (40mm) (98F758F4-A4F3-4B9F-93AF-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 13 Pro (FCE87CE8-38EF-4A9B-972A-XXXXXXXXXXXX) (Shutdown)
9E5FF1C8-3F65-494A-A5C8-CE6A5F1C8F1B (unavailable)
    Watch: Apple Watch Series 6 (44mm) (01AD0AF2-A899-4385-9B85-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 13 Pro Max (B3D45978-3FCC-456A-85D1-XXXXXXXXXXXX) (Shutdown)
17D946FD-0723-4849-994F-9A6B5CCF11B8 (unavailable)
    Watch: Apple Watch Series 7 - 41mm (D9425E14-88BF-4870-896D-XXXXXXXXXXXX) (Shutdown)
    Phone: iPhone 13 mini (3850256F-30C8-4DC5-9B9E-XXXXXXXXXXXX) (Shutdown)
92209090-A1D3-4AF0-B49E-7AC8C1E25C44 (unavailable)
    Watch: Apple Watch Series 7 (45mm) (0B8B611C-0306-4EF8-86D3-XXXXXXXXXXXX)
```
