const CIRCLE_CLASS="circle"
const X_CLASS="x"
const cellElts=document.querySelectorAll("[data-cell]")
const board=document.getElementById("board")
const winningMessage=document.getElementById("winningMessage")
let circleTurn
const restartButton=document.getElementById('restartButton')
const winningMessageTextElt=document.querySelector("[data-winning-message-text]")
const WINNING_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
]

const checkWin=(currentClass)=>{
    return WINNING_COMBINATIONS.some(combination=>{
        return combination.every(index=>{
            return cellElts[index].classList.contains(currentClass)
        })
    })
}

const placeMark=(currentClass,cell)=>{
    cell.classList.add(currentClass)
}

const swapTurns=()=>{
    circleTurn =!circleTurn
}

const setBoardHoverClass=()=>{
    board.classList.remove(CIRCLE_CLASS)
    board.classList.remove(X_CLASS)
    if (circleTurn){
        board.classList.add(CIRCLE_CLASS)
    }else{
        board.classList.add(X_CLASS)
    }
}

const isDraw=()=>{
    return [...cellElts].every(cell=>{
        return cell.classList.contains(X_CLASS) || cell.classList.contains(CIRCLE_CLASS)
    })
}

const endGame=(draw)=>{
    if (isDraw()){
        winningMessageTextElt.innerText="Draw!"
    }else{
        winningMessageTextElt.innerText=`${circleTurn ? "O's":"X's"} Wins!`
    }
    winningMessage.classList.add("show")
}

const handleClick=e=>{
    const cell=e.target
    const currentClass=circleTurn ? CIRCLE_CLASS:X_CLASS
    placeMark(currentClass,cell)
    if (checkWin(currentClass)){
        endGame(false)
    }else if (isDraw()){
        endGame(true)
    }else{
        swapTurns()
        setBoardHoverClass()
    } 
}

const startGame=()=>{
    circleTurn=false
    cellElts.forEach(cell=>{
        cell.classList.remove(X_CLASS)
        cell.classList.remove(CIRCLE_CLASS)
        cell.removeEventListener("click",handleClick)
        cell.addEventListener("click",handleClick,{once:true})
    })
    setBoardHoverClass()
    winningMessage.classList.remove("show")
}

startGame()

restartButton.addEventListener("click",startGame)
