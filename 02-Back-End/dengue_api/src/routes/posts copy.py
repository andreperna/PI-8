from fastapi import APIRouter

router = APIRouter()

@router.post('/', tags=["Inserir OcorrĂȘncias"])
def criar_ocorrencia(ocorrencia: Ocorrencia):
    return ocorrencia