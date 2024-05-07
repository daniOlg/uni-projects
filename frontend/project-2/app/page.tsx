import Image from "next/image";

export default function Home() {
    return (
        <>
            <div className='fixed-bg fixed top-0 left-0' style={{width: '100vw', height: '50vh'}}></div>
            <div className='bg-gray-100 mt-96'>
                <main className="flex min-h-screen flex-col items-center justify-between p-24">
                    <section className='flex flex-col gap-5 mb-24'>
                        <div className='text-center'>
                            <h2 className='font-bold text-sky-700'>Mantenimiento</h2>
                            <span className='italic'>Conjunto de operaciones y cuidados necesarios para que sus instalaciones continuen funcionando correctamente.</span>
                        </div>
                        <div className='text-center'>
                            <h2 className='font-bold text-sky-700'>Mantenimiento preventivo</h2>
                            <span className='italic'>Ayuda a prolongar la vida útil de tus activos y aumenta la productividad, a través de una revisión.</span>
                        </div>
                        <div className='text-center'>
                            <h2 className='font-bold text-sky-700'>Mantenimiento correctivo</h2>
                            <span className='italic'>Corrige problemas o daños en las instalaciones o equipos.</span>
                        </div>
                    </section>
                    <section>
                        <div className='flex flex-col gap-y-10'>
                            <div className='columns-1 lg:columns-2'>
                                <div className='flex gap-3'>
                                    <Image src='/images/aire-acondicionado.webp' alt='Aire acondicionado' width={200}
                                           height={200}></Image>
                                    <div>
                                        <h2>Aire acondicionado</h2>
                                        <span>Instalamos, reparamos y revisamos todo tipo de sistemas de aire acondicionado, tanto domésticos como industriales. Nos encargamos de la limpieza, el cambio de filtros, la recarga de gas y la detección y solución de averías.</span>
                                    </div>
                                </div>
                                <div className='flex gap-3'>
                                    <Image src='/images/sala-de-calderas.webp' alt='Sala de calderas' width={200}
                                           height={200}></Image>
                                    <div>
                                        <h2>Sala de calderas</h2>
                                        <span>Instalamos, reparamos y revisamos todo tipo de calderas, tanto de gas como eléctricas. Nos encargamos del mantenimiento preventivo, la sustitución de piezas, la purga de radiadores y la regulación de la presión y la temperatura.</span>
                                    </div>
                                </div>

                            </div>
                            <div className='columns-1 lg:columns-2'>
                                <div className='flex gap-3'>
                                    <Image src='/images/grupo-electrogeno.webp' alt='Aire acondicionado' width={200}
                                           height={200}></Image>
                                    <div>
                                        <h2>Aire acondicionado</h2>
                                        <span>Instalamos, reparamos y revisamos todo tipo de sistemas de aire acondicionado, tanto domésticos como industriales. Nos encargamos de la limpieza, el cambio de filtros, la recarga de gas y la detección y solución de averías.</span>
                                    </div>
                                </div>
                                <div className='flex gap-3'>
                                    <Image src='/images/sala-de-bombas.webp' alt='Sala de calderas' width={200}
                                           height={200}></Image>
                                    <div>
                                        <h2>Sala de calderas</h2>
                                        <span>Instalamos, reparamos y revisamos todo tipo de calderas, tanto de gas como eléctricas. Nos encargamos del mantenimiento preventivo, la sustitución de piezas, la purga de radiadores y la regulación de la presión y la temperatura.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section className='mt-24 flex flex-col gap-5'>
                        <div className='text-center'>
                            <h2 className='font-bold text-sky-700 text-xl'>¿Alguna pregunta?</h2>
                            <span className='italic'>Envía un correo a Contacto @energyandwater.cl o escribenos por Whatsapp para obtener más información sobre mantenimiento</span>
                        </div>
                        <button className='bg-sky-700 text-white font-bold text-center w-[100%] py-2'>WhatsApp</button>
                    </section>
                </main>
                <footer className='bg-white p-10'>
                    <div className='text-center'>contacto@energyandwater.cl | Manquehue Sur 520, oficina 205, Las Condes
                        | +56232569798
                    </div>
                </footer>
            </div>
        </>
    );
}
