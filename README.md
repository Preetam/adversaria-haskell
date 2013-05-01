# Adversaria

## Example outputs

```
  02:11:20
    ⚡ bin: ./adversaria init dbFile
init

  02:11:55
    ⚡ bin: ./adversaria set dbFile 1367388708 0.0

  02:12:00
    ⚡ bin: ./adversaria set dbFile 1367388709 1.0

  02:12:07
    ⚡ bin: ./adversaria print dbFile 
[[1367388708,0],[1367388709,1]]

  02:12:16
    ⚡ bin: ./adversaria set dbFile 1367388710 0.5

  02:12:26
    ⚡ bin: ./adversaria range dbFile 1367388708 1367388710
[[1367388708,0],[1367388709,1],[1367388710,0.5]]

  02:12:44
    ⚡ bin: ./adversaria range dbFile 1367388708 1367388709
[[1367388708,0],[1367388709,1]]

```

## Usage

### Initialize
`./adversaria init dbFile`

### Set
`./adversaria set dbFile 1367388708 0.0`

### Range reads
`./adversaria range dbFile 1367388708 1367388710`

### Print
`./adversaria print dbFile`

## License
MIT
