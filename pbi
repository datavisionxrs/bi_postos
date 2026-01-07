import React, { useState } from 'react';
import { 
  BarChart3, 
  Fuel, 
  TrendingUp, 
  Database, 
  Layers, 
  ShoppingCart, 
  Users, 
  DollarSign, 
  AlertTriangle,
  ChevronRight, 
  ClipboardList, 
  Target, 
  Activity, 
  ArrowUpRight, 
  ArrowDownRight,
  Maximize2,
  PieChart,
  LayoutDashboard
} from 'lucide-react';

const App = () => {
  const [activeTab, setActiveTab] = useState('geral');
  
  const logoUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAXhWrEeRYNU8oAhonRIL_SFcmBRGlkceYqg&s";

  const dashboardPages = [
    {
      id: 'geral',
      title: '1. Visão Geral (Diretoria)',
      icon: <Target className="w-5 h-5" />,
      description: ' cockpit executivo para entender se o posto está "ganhando dinheiro" e identificar gargalos.',
      kpis: [
        'Faturamento total (R$) – Dia / Semana / Mês / Acumulado',
        'Volume total (L) – por período',
        'Margem bruta (R$) e (%) – total e por combustível',
        'Ticket médio (R$) – por abastecimento',
        'Qtde de abastecimentos (nº de cupons)',
        'Preço médio (R$/L) – por produto',
        'Perdas estimadas (R$) – estoque x vendas',
        'Ranking produtos por contribuição de margem'
      ],
      alerts: [
        'Margem do mês abaixo da meta',
        'Volume caiu vs mês anterior / YoY',
        'Divergência de estoque acima do limite'
      ]
    },
    {
      id: 'comercial',
      title: '2. Comercial e Vendas',
      icon: <Fuel className="w-5 h-5" />,
      description: 'Análise detalhada do que vende, quando vende e impacto no volume.',
      kpis: [
        'Volume por produto: Gasolina C, Etanol, Diesel S10, S500, GNV',
        'Faturamento por produto',
        'Margem (R$/L) e margem total (R$) por produto',
        'Mix de vendas (%) por produto',
        'Vendas por turno (manhã/tarde/noite)',
        'Comparativo mês atual vs M-1 e YoY'
      ],
      visuals: ['Linha: Volume diário e média móvel', 'Barra: Margem total por produto', 'Heatmap: Turno x Dia da Semana']
    },
    {
      id: 'precificacao',
      title: '3. Precificação e Mercado',
      icon: <TrendingUp className="w-5 h-5" />,
      description: 'Medição do impacto do preço no volume e monitoramento da concorrência.',
      kpis: [
        'Preço bomba vs preço compra',
        'Spread (R$/L) = preço venda – custo médio',
        'Preço vs concorrência (Ranking e centavos)',
        'Elasticidade: variação preço x volume'
      ],
      alerts: ['Spread abaixo do mínimo', 'Preço acima do mercado com volume em queda']
    },
    {
      id: 'operacao',
      title: '4. Estoque e Tanques',
      icon: <Layers className="w-5 h-5" />,
      description: 'Controle de risco de ruptura, excesso e perdas operacionais.',
      kpis: [
        'Estoque atual (L) por tanque/produto',
        'Dias de cobertura (Estoque / Média Venda)',
        'Rupturas (impacto em vendas)',
        'Entrada x Saída (L) por período',
        'Divergência físico x sistema',
        'Perdas / evaporação estimada'
      ],
    },
    {
      id: 'rentabilidade',
      title: '5. Rentabilidade Real',
      icon: <Activity className="w-5 h-5" />,
      description: 'Análise profunda de onde o lucro nasce e onde ele morre.',
      kpis: [
        'Margem por produto (R$/L)',
        'Margem por bomba / pista',
        'Margem por forma de pagamento',
        'Taxas de cartão (R$ e %) e impacto na margem',
        'Custo operacional estimado por litro'
      ],
    },
    {
      id: 'conveniencia',
      title: '6. Loja de Conveniência',
      icon: <ShoppingCart className="w-5 h-5" />,
      description: 'Gestão de ticket médio e margem de produtos fora da bomba.',
      kpis: [
        'Faturamento loja e margem (R$ / %)',
        'Ticket médio loja',
        'Itens por compra',
        'Top produtos (ABC)',
        'Perdas/Quebras/Validade',
        'Combos e associação de produtos'
      ],
    },
    {
      id: 'fidelidade',
      title: '7. Fidelidade e Clientes',
      icon: <Users className="w-5 h-5" />,
      description: 'Análise de retenção, recorrência e perfil do consumidor.',
      kpis: [
        'Clientes únicos',
        'Recorrência (30 dias)',
        'Frequência média (dias)',
        'LTV simples (Lifetime Value)',
        'Segmentos: Frotista, Varejo, Ocasional'
      ],
    },
    {
      id: 'financeiro',
      title: '8. Financeiro e Conciliação',
      icon: <DollarSign className="w-5 h-5" />,
      description: 'Batimento rigoroso de vendas vs recebíveis e taxas.',
      kpis: [
        'Recebido vs Vendido (Conciliação)',
        'Pendente de recebimento (Cartões/Frotas)',
        'Taxas de adquirência por bandeira',
        'Chargeback / Divergências',
        'Prazo Médio de Recebimento (PMR)'
      ],
    }
  ];

  const DashboardMockup = ({ type }) => {
    const renderContent = () => {
      switch (type) {
        case 'geral':
          return (
            <div className="space-y-4">
              <div className="grid grid-cols-4 gap-2">
                {['Faturamento', 'Volume', 'Margem', 'Ticket'].map((label, i) => (
                  <div key={i} className="bg-slate-800 p-3 rounded-xl border border-slate-700 shadow-inner">
                    <div className="text-[8px] text-slate-500 font-bold uppercase mb-1">{label}</div>
                    <div className="h-4 w-16 bg-blue-500 rounded"></div>
                  </div>
                ))}
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div className="h-36 bg-slate-800/50 rounded-xl border border-slate-700 p-3 flex flex-col">
                   <div className="text-[8px] text-slate-500 font-bold uppercase mb-4">Margem por Combustível</div>
                   <div className="flex-1 flex items-end gap-2">
                      {[60, 40, 80, 50].map((h, i) => (
                        <div key={i} style={{ height: `${h}%` }} className="flex-1 bg-blue-500/40 rounded-t"></div>
                      ))}
                   </div>
                </div>
                <div className="h-36 bg-slate-800/50 rounded-xl border border-slate-700 p-3 flex items-center justify-center">
                  <div className="w-20 h-20 rounded-full border-[8px] border-slate-700 border-t-emerald-500 flex items-center justify-center rotate-45">
                    <span className="text-[10px] text-white font-black -rotate-45">Margem %</span>
                  </div>
                </div>
              </div>
            </div>
          );
        case 'comercial':
          return (
            <div className="space-y-4">
              <div className="h-44 bg-slate-800 rounded-xl border border-slate-700 p-4 relative">
                <div className="text-[8px] text-slate-500 font-bold uppercase mb-2">Volume Diário (30 dias)</div>
                <svg className="w-full h-28" viewBox="0 0 100 20" preserveAspectRatio="none">
                  <path d="M0,15 Q10,5 20,12 T40,8 T60,15 T80,5 T100,10" fill="none" stroke="#3b82f6" strokeWidth="0.5" />
                  <path d="M0,15 Q10,5 20,12 T40,8 T60,15 T80,5 T100,10 L100,20 L0,20 Z" fill="url(#grad1)" opacity="0.1" />
                </svg>
              </div>
              <div className="grid grid-cols-3 gap-2">
                <div className="h-10 bg-amber-500/20 rounded-lg border border-amber-500/30 flex items-center justify-center text-[8px] font-bold">GASOLINA</div>
                <div className="h-10 bg-blue-500/20 rounded-lg border border-blue-500/30 flex items-center justify-center text-[8px] font-bold">DIESEL</div>
                <div className="h-10 bg-emerald-500/20 rounded-lg border border-emerald-500/30 flex items-center justify-center text-[8px] font-bold">ETANOL</div>
              </div>
            </div>
          );
        case 'operacao':
          return (
            <div className="grid grid-cols-4 gap-4 h-full py-4">
              {['G. Comum', 'G. Adit', 'Diesel', 'Etanol'].map((t, i) => (
                <div key={i} className="flex flex-col items-center gap-2">
                  <div className="w-12 h-40 bg-slate-800 rounded-2xl border-2 border-slate-700 relative overflow-hidden flex flex-col justify-end">
                    <div className="bg-gradient-to-t from-blue-600 to-blue-400 w-full shadow-[0_-4px_10px_rgba(59,130,246,0.3)]" style={{ height: i === 0 ? '75%' : i === 1 ? '40%' : i === 2 ? '90%' : '20%' }}></div>
                    <div className="absolute inset-0 flex items-center justify-center">
                      <span className="text-[8px] font-black text-white rotate-[-90deg] opacity-50 uppercase tracking-tighter">{t}</span>
                    </div>
                  </div>
                  <span className="text-[8px] font-bold text-slate-500">{t}</span>
                </div>
              ))}
            </div>
          );
        case 'precificacao':
          return (
            <div className="space-y-6">
              <div className="text-[10px] font-bold text-slate-400 border-b border-slate-700 pb-2">Preço vs Concorrência (R$)</div>
              {['Nosso Posto', 'Posto A (Vizinho)', 'Posto B (Shell)', 'Média Região'].map((p, i) => (
                <div key={i} className="flex items-center gap-3">
                  <span className="text-[9px] w-24 text-slate-500 truncate">{p}</span>
                  <div className="flex-1 h-3 bg-slate-800 rounded-full overflow-hidden">
                    <div className={`h-full ${i === 0 ? 'bg-blue-500' : 'bg-slate-600'}`} style={{ width: `${90 - (i*5)}%` }}></div>
                  </div>
                  <span className="text-[9px] font-bold text-slate-300">R$ 5,{80 + i}</span>
                </div>
              ))}
              <div className="mt-4 p-3 bg-blue-500/10 border border-blue-500/20 rounded-xl">
                 <div className="text-[8px] font-black text-blue-400 uppercase">Spread Médio Sugerido</div>
                 <div className="text-lg font-black text-white">R$ 0,65/L</div>
              </div>
            </div>
          );
        case 'financeiro':
          return (
             <div className="space-y-4">
               <div className="grid grid-cols-2 gap-4">
                  <div className="bg-slate-800 p-4 rounded-xl border border-slate-700">
                    <div className="text-[8px] text-slate-500 font-bold mb-1">Vendido</div>
                    <div className="h-5 w-24 bg-blue-500 rounded mb-1"></div>
                    <div className="text-[8px] text-emerald-500">Conciliado (98%)</div>
                  </div>
                  <div className="bg-slate-800 p-4 rounded-xl border border-slate-700">
                    <div className="text-[8px] text-slate-500 font-bold mb-1">Taxas Cartão</div>
                    <div className="h-5 w-16 bg-rose-500/40 rounded mb-1"></div>
                    <div className="text-[8px] text-rose-400">R$ 12.450,00</div>
                  </div>
               </div>
               <div className="h-28 bg-slate-800/30 border border-dashed border-slate-700 rounded-xl flex items-center justify-center">
                  <span className="text-[10px] text-slate-600 font-bold uppercase tracking-widest">Calendário de Recebíveis</span>
               </div>
             </div>
          );
        default:
          return (
            <div className="h-full flex flex-col items-center justify-center text-slate-600 gap-3 border border-slate-700 border-dashed rounded-3xl">
              <PieChart className="w-12 h-12 opacity-20" />
              <p className="text-[10px] font-black uppercase tracking-[0.4em]">Módulo em Análise</p>
            </div>
          );
      }
    };

    return (
      <div className="bg-[#0f172a] rounded-[2.5rem] border border-slate-700 shadow-2xl overflow-hidden relative flex flex-col h-full min-h-[400px]">
        <div className="h-10 bg-slate-800 flex items-center px-6 gap-2 border-b border-slate-700/50">
          <div className="w-2.5 h-2.5 rounded-full bg-rose-500/40"></div>
          <div className="w-2.5 h-2.5 rounded-full bg-amber-500/40"></div>
          <div className="w-2.5 h-2.5 rounded-full bg-emerald-500/40"></div>
          <div className="ml-4 h-4 w-48 bg-slate-700/50 rounded-full flex items-center px-3">
             <div className="w-2 h-2 bg-blue-500 rounded-full animate-pulse mr-2"></div>
             <span className="text-[8px] text-slate-500 font-bold uppercase tracking-widest">POSTOBI_V4_LIVE.PBIX</span>
          </div>
        </div>
        <div className="p-8 flex-1 overflow-hidden">
          {renderContent()}
        </div>
        <div className="absolute bottom-6 left-8 flex items-center gap-2">
           <div className="h-2 w-2 bg-emerald-500 rounded-full shadow-[0_0_8px_rgba(16,185,129,0.5)]"></div>
           <span className="text-[8px] text-slate-500 font-black uppercase tracking-widest">Última Carga: Há 5 min</span>
        </div>
      </div>
    );
  };

  return (
    <div className="h-screen flex flex-col bg-[#f8fafc] overflow-hidden font-sans">
      {/* Barra Superior Minimalista */}
      <header className="bg-[#0f172a] text-white h-16 px-8 flex items-center justify-between shrink-0 border-b border-blue-500/30 relative z-50">
        <div className="flex items-center gap-4">
          <div className="relative">
            <img src={logoUrl} alt="Logo" className="w-10 h-10 object-contain bg-white rounded-xl p-0.5 shadow-lg border border-white/20" />
            <div className="absolute -bottom-1 -right-1 w-4 h-4 bg-blue-600 rounded-full border-2 border-[#0f172a] flex items-center justify-center">
              <Activity className="w-2 h-2 text-white" />
            </div>
          </div>
          <div>
            <span className="font-black text-lg tracking-tighter uppercase italic block leading-none">PostoBI <span className="text-blue-500">Pro</span></span>
            <span className="text-[9px] text-slate-400 font-black uppercase tracking-widest leading-none">Dashboard Strategy Implementation</span>
          </div>
        </div>
        
        <div className="flex items-center gap-4">
          <div className="hidden lg:flex flex-col text-right">
             <span className="text-[8px] font-black text-slate-500 uppercase tracking-widest">Project Scope</span>
             <span className="text-[10px] font-bold text-blue-400">Total 8 Páginas / 42 KPIs</span>
          </div>
          <button className="bg-blue-600 hover:bg-blue-500 text-white px-5 py-2 rounded-xl font-black text-[10px] uppercase tracking-widest transition-all shadow-lg shadow-blue-600/30">
            Apresentar Proposta
          </button>
        </div>
      </header>

      {/* Área Principal de Trabalho */}
      <div className="flex flex-1 overflow-hidden">
        
        {/* Navegação Lateral de Slides */}
        <aside className="w-72 bg-white border-r border-slate-200 flex flex-col shrink-0 relative z-40 shadow-xl">
          <div className="p-6 border-b border-slate-100 bg-slate-50/50">
            <div className="flex items-center gap-2 mb-1">
              <LayoutDashboard className="w-4 h-4 text-blue-600" />
              <h3 className="text-[10px] font-black text-slate-900 uppercase tracking-widest">Painéis Estruturados</h3>
            </div>
          </div>
          <nav className="flex-1 overflow-y-auto p-3 space-y-1.5 custom-scrollbar">
            {dashboardPages.map((page) => (
              <button
                key={page.id}
                onClick={() => setActiveTab(page.id)}
                className={`w-full flex items-center gap-3 px-4 py-4 rounded-2xl transition-all group ${
                  activeTab === page.id 
                    ? 'bg-blue-600 text-white shadow-xl shadow-blue-200' 
                    : 'text-slate-500 hover:bg-slate-100 hover:text-slate-900'
                }`}
              >
                <div className={activeTab === page.id ? 'text-white' : 'text-blue-500 group-hover:scale-110 transition-transform'}>
                  {page.icon}
                </div>
                <span className="font-bold text-[11px] truncate uppercase tracking-tight">{page.title}</span>
              </button>
            ))}
          </nav>
          <div className="p-6 bg-slate-50 border-t border-slate-200">
            <div className="flex items-center gap-2 mb-3">
              <Maximize2 className="w-3 h-3 text-blue-600" />
              <span className="text-[9px] font-black text-slate-500 uppercase tracking-[0.2em]">Fluxo de Gestão</span>
            </div>
            <div className="h-1.5 bg-slate-200 rounded-full overflow-hidden">
              <div 
                className="h-full bg-blue-500 transition-all duration-700" 
                style={{ width: `${((dashboardPages.findIndex(p => p.id === activeTab) + 1) / dashboardPages.length) * 100}%` }}
              ></div>
            </div>
          </div>
        </aside>

        {/* Slide Ativo - Fit to Screen */}
        <main className="flex-1 overflow-hidden flex flex-col p-8 lg:p-12">
          {dashboardPages.filter(p => p.id === activeTab).map(page => (
            <div key={page.id} className="h-full flex flex-col animate-in fade-in slide-in-from-right-8 duration-700">
              
              {/* Topo do Slide */}
              <div className="mb-10 shrink-0">
                <div className="flex items-center gap-4 mb-4">
                  <div className="inline-flex items-center gap-2 px-4 py-2 bg-blue-50 text-blue-700 rounded-full text-[10px] font-black uppercase tracking-widest border border-blue-100 shadow-sm">
                    {page.icon} Relatório BI
                  </div>
                </div>
                <h2 className="text-5xl font-black text-slate-900 tracking-tighter mb-4 leading-none">
                  {page.title.split('. ')[1]}
                </h2>
                <p className="text-xl text-slate-500 font-medium max-w-3xl leading-snug">
                  {page.description}
                </p>
              </div>

              {/* Corpo do Slide - Grid 40/60 */}
              <div className="flex-1 grid grid-cols-1 lg:grid-cols-12 gap-12 overflow-hidden">
                
                {/* Coluna 1: Conteúdo Original Detalhado (Scrollable) */}
                <div className="lg:col-span-5 flex flex-col gap-8 overflow-y-auto pr-6 custom-scrollbar pb-10">
                  
                  {/* Bloco de KPIs */}
                  <div className="space-y-6">
                    <h4 className="flex items-center gap-3 text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">
                      <ClipboardList className="w-4 h-4 text-blue-600" />
                      Indicadores (KPIs)
                    </h4>
                    <div className="grid grid-cols-1 gap-2.5">
                      {page.kpis.map((kpi, idx) => (
                        <div key={idx} className="flex items-start gap-4 p-4 bg-white rounded-2xl border border-slate-100 shadow-sm hover:border-blue-200 transition-colors group cursor-default">
                          <div className="w-1.5 h-1.5 bg-blue-500 rounded-full mt-1.5 group-hover:scale-125 transition-transform shadow-[0_0_8px_rgba(59,130,246,0.6)]"></div>
                          <span className="text-[13px] font-bold text-slate-700 leading-tight tracking-tight">{kpi}</span>
                        </div>
                      ))}
                    </div>
                  </div>

                  {/* Bloco de Alertas ou Observações */}
                  {page.alerts ? (
                    <div className="bg-rose-50/50 border border-rose-100 rounded-[2rem] p-8 relative overflow-hidden group shadow-inner">
                      <div className="absolute -top-4 -right-4 opacity-[0.05] group-hover:scale-110 transition-transform">
                        <AlertTriangle className="w-32 h-32 text-rose-600" />
                      </div>
                      <h4 className="text-[10px] font-black text-rose-800 uppercase tracking-widest mb-4 flex items-center gap-2">
                        <div className="w-1.5 h-1.5 bg-rose-500 rounded-full animate-ping"></div>
                        Regras de Alerta Automático
                      </h4>
                      <ul className="space-y-3">
                        {page.alerts.map((alert, idx) => (
                          <li key={idx} className="flex items-start gap-3">
                            <ChevronRight className="w-4 h-4 mt-0.5 text-rose-400 shrink-0" />
                            <span className="text-sm font-bold text-rose-900/70 leading-tight">{alert}</span>
                          </li>
                        ))}
                      </ul>
                    </div>
                  ) : (
                    <div className="bg-[#0f172a] rounded-[2rem] p-8 text-white shadow-2xl relative overflow-hidden group">
                      <div className="absolute top-0 right-0 p-4 opacity-10">
                         <BarChart3 className="w-20 h-20" />
                      </div>
                      <h4 className="text-[10px] font-black text-blue-400 uppercase tracking-widest mb-4">Meta Estratégica</h4>
                      <p className="text-sm text-slate-300 leading-relaxed font-bold tracking-tight">
                        Foco em monitoramento de margem por litro e mix de produtos para garantir rentabilidade operacional acima de 12% no mês.
                      </p>
                    </div>
                  )}
                </div>

                {/* Coluna 2: Mockup Visual da Tela (Fixed) */}
                <div className="lg:col-span-7 flex flex-col gap-6 overflow-hidden">
                  <div className="flex-1 min-h-0 flex flex-col gap-4">
                    <div className="flex justify-between items-center text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] px-2 shrink-0">
                      <span>Visualização de Dados</span>
                      <div className="flex gap-4">
                        <span className="flex items-center gap-1.5"><div className="w-2 h-2 bg-blue-500 rounded-full"></div> Meta</span>
                        <span className="flex items-center gap-1.5"><div className="w-2 h-2 bg-slate-300 rounded-full"></div> Histórico</span>
                      </div>
                    </div>
                    
                    <div className="flex-1">
                      <DashboardMockup type={page.id} />
                    </div>

                    {/* Rodapé do Slide com Status */}
                    <div className="grid grid-cols-2 gap-6 shrink-0 pt-2">
                      <div className="p-5 bg-white rounded-3xl border border-slate-100 shadow-sm flex items-center gap-4 group hover:border-blue-200 transition-all">
                        <div className="p-3 bg-emerald-50 text-emerald-600 rounded-2xl group-hover:bg-emerald-500 group-hover:text-white transition-all shadow-sm">
                          <ArrowUpRight className="w-5 h-5" />
                        </div>
                        <div>
                          <p className="text-[9px] text-slate-400 font-black uppercase tracking-widest">Performance Volume</p>
                          <p className="text-xl font-black text-slate-900 tracking-tighter">+14.2%</p>
                        </div>
                      </div>
                      <div className="p-5 bg-white rounded-3xl border border-slate-100 shadow-sm flex items-center gap-4 group hover:border-rose-200 transition-all">
                        <div className="p-3 bg-rose-50 text-rose-600 rounded-2xl group-hover:bg-rose-500 group-hover:text-white transition-all shadow-sm">
                          <ArrowDownRight className="w-5 h-5" />
                        </div>
                        <div>
                          <p className="text-[9px] text-slate-400 font-black uppercase tracking-widest">Quebras Estimadas</p>
                          <p className="text-xl font-black text-slate-900 tracking-tighter">-1.8%</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          ))}
        </main>
      </div>

      <style dangerouslySetInnerHTML={{ __html: `
        .custom-scrollbar::-webkit-scrollbar {
          width: 5px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
          background: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
          background: #e2e8f0;
          border-radius: 20px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
          background: #cbd5e1;
        }
      `}} />
    </div>
  );
};

export default App;
